import util from 'util';
import { exec } from 'child_process';
import enquirer from 'enquirer';

const devices = [];
const asyncExec = util.promisify(exec);
const parseJson = jsonString => {
  try {
    return JSON.parse(jsonString);
  } catch (e) {
    return undefined;
  }
};

async function changeDevice(device) {
  const names = devices.map(d => d.name);
  const ids = devices.map(d => d.id);
  const index = names.findIndex(element => element === device);
  const id = ids[index];

  await asyncExec(`SwitchAudioSource -i ${id}`);
  console.log(`❯ Selected ${device} as new audio output device`);
  console.log('❯ Restarting Spotify Daemon');

  await asyncExec('brew services restart spotifyd');
  console.log('❯ Done 😀🎧🤘');
}

async function main() {
  const { stdout } = await asyncExec('SwitchAudioSource -a -f json');
  const lines = stdout.split(/\r?\n/).filter(element => element);

  lines.forEach(line => {
    const device = parseJson(line);
    if (device !== undefined && device.type === 'output') {
      devices.push(device);
    }
  });

  if (devices.length > 0) {
    const { AutoComplete } = enquirer;
    const prompt = new AutoComplete({
      name: 'device',
      multiple: false,
      message: 'Pick output audio device',
      limit: 10,
      initial: 0,
      choices: devices.map(d => d.name),
    });

    prompt.run().then(device => changeDevice(device));
  }
}

main();

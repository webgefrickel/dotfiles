#!/usr/bin/env node
import util from 'util';
import { exec } from 'child_process';
import inquirer from 'inquirer';

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
  console.log(`❯ Selected »${device}« as new audio output device`);
  console.log('❯ Done 🤘');
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
    inquirer.prompt([{
      type: 'list',
      name: 'device',
      message: 'Choose your desired output audio device:',
      choices: devices.map(d => d.name),
    }]).then(answer => {
      changeDevice(answer.device);
    });
  }
}

main();

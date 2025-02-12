#!/usr/bin/env node
import util from 'util';
import { exec } from 'child_process';
import inquirer from 'inquirer';

const asyncExec = util.promisify(exec);
const parseJson = jsonString => {
  try {
    return JSON.parse(jsonString);
  } catch (e) {
    return undefined;
  }
};

const fetchDevices = async () => {
  const { stdout } = await asyncExec('SwitchAudioSource -a -f json');
  return stdout
    .split(/\r?\n/)
    .map(parseJson)
    .filter(device => device?.type === 'output');
};

const changeDevice = async (device, devices) => {
  const id = devices.find(d => d.name === device)?.id;

  if (id) {
    await asyncExec(`SwitchAudioSource -i ${id}`);
    console.log(`❯ Selected »${device}« as new audio output device`);
    console.log('❯ Done 🤘');
  } else {
    console.error('Device not found');
  }
};

const promptUserForDevice = async (devices) => {
  const { device } = await inquirer.prompt([{
    type: 'list',
    name: 'device',
    message: 'Choose your desired output audio device:',
    choices: devices.map(d => d.name),
  }]);

  return device;
};

const main = async () => {
  try {
    const devices = await fetchDevices();
    if (devices.length > 0) {
      const selectedDevice = await promptUserForDevice(devices);
      await changeDevice(selectedDevice, devices);
    }
  } catch (error) {
    // do nothing, silently exit
  }
};

main();

#!/usr/bin/env node
import fs from 'fs/promises';
import path from 'path';
import util from 'util';
import { cwd } from 'process';
import { exec } from 'child_process';
import sharp from 'sharp';

const asyncExec = util.promisify(exec);

async function listDir() {
  try {
    return await fs.readdir(cwd());
  } catch (err) {
    console.error('Error occurred while reading directory:', err);
  }
}

async function main() {
  console.log('Converting HEIC-images to highres JPG with ImageMagick');
  await asyncExec('mogrify -format jpg -strip -quality 90 *.HEIC');
  console.log('Removing HEIC-images');
  await asyncExec('rm *.HEIC');
  console.log('Downscaling JPG-images with sharp (2560px, progressive, q70)');
  const files = await listDir();
  const jpgs = files.filter(f => path.extname(f) === '.jpg');

  jpgs.forEach(jpg => {
    sharp(jpg)
      .resize(2560)
      .jpeg({
          quality: 70,
          progressive: true,
          mozjpeg: true,
        })
      .toFile(`__${jpg}`)
      .then(() => {
        console.log(`Processing file ${jpg}... done 🤘`);
        fs.rename(`__${jpg}`, jpg);
      });
  });
}

main();

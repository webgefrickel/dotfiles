#!/usr/bin/env node
import fs from 'fs/promises';
import path from 'path';
import util from 'util';
import { cwd } from 'process';
import { exec } from 'child_process';
import sharp from 'sharp';

const asyncExec = util.promisify(exec);

const listDir = async () => {
  try {
    return await fs.readdir(cwd());
  } catch (err) {
    console.error('Error occurred while reading directory:', err);
    return [];
  }
};

const processImage = async (jpg) => {
  try {
    await sharp(jpg)
      .resize(2560)
      .jpeg({
        quality: 70,
        progressive: true,
        mozjpeg: true,
      })
      .toFile(`__${jpg}`);
    await fs.rename(`__${jpg}`, jpg);
    console.log(`Processed file ${jpg}... done 🤘`);
  } catch (err) {
    console.error(`Error processing file ${jpg}:`, err);
  }
};

const main = async () => {
  try {
    console.log('Converting HEIC images to high-res JPG with ImageMagick');
    await asyncExec('mogrify -format jpg -strip -quality 90 *.HEIC');
    console.log('Removing HEIC images');
    await asyncExec('rm *.HEIC');
    console.log('Downscaling JPG images with sharp (2560px, progressive, q70)');
    const files = await listDir();
    const jpgs = files.filter(f => path.extname(f) === '.jpg');
    await Promise.all(jpgs.map(processImage));
  } catch (error) {
    // do nothing, silently exit
  }
};

main();

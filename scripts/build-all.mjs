#!/usr/bin/env node
/**
 * Build one or all lecture sub-folders.
 *
 * Usage:
 *   node scripts/build-all.mjs            # build every luento*
 *   node scripts/build-all.mjs luento1    # build only luento1
 */

import { execSync } from "child_process";
import { readdirSync, existsSync } from "fs";
import { resolve, dirname } from "path";
import { fileURLToPath } from "url";

const ROOT = dirname(dirname(fileURLToPath(import.meta.url)));
const SLIDEV = resolve(ROOT, "node_modules/.bin/slidev");

const target = process.argv[2];
const lectures = target
  ? [target]
  : readdirSync(ROOT).filter((d) => /^luento\d+$/.test(d));

for (const lecture of lectures) {
  const dir = resolve(ROOT, lecture);
  const slides = resolve(dir, "slides.md");
  if (!existsSync(slides)) {
    console.warn(`⚠  Skipping ${lecture}: no slides.md found`);
    continue;
  }
  const out = resolve(ROOT, "dist", lecture);
  const base = `/${lecture}/`;
  console.log(`\n▶ Building ${lecture} → dist/${lecture}/`);
  execSync(
    `${SLIDEV} build ${slides} --base ${base} --out ${out}`,
    { stdio: "inherit", cwd: dir }
  );
  console.log(`✓ ${lecture} done`);
}

console.log("\n✅ All lectures built.");

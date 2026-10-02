// Gera dev/site/draandressa/index.html: a proposta cifrada com AES-GCM (chave derivada da senha por PBKDF2).
// O repo é público, então só o texto cifrado sobe; a fonte (proposta.html) fica fora do git.
// Uso: node dev/draandressa/build.mjs <senha>
import { readFileSync, writeFileSync, mkdirSync } from 'node:fs';
import { webcrypto as crypto } from 'node:crypto';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';

const senha = process.argv[2];
if (!senha) { console.error('Uso: node dev/draandressa/build.mjs <senha>'); process.exit(1); }

const aqui = dirname(fileURLToPath(import.meta.url));
const fonte = readFileSync(join(aqui, 'proposta.html'), 'utf8');
const ITER = 600000;
const b64 = u => Buffer.from(u).toString('base64');

const salt = crypto.getRandomValues(new Uint8Array(16));
const iv = crypto.getRandomValues(new Uint8Array(12));
const base = await crypto.subtle.importKey('raw', new TextEncoder().encode(senha), 'PBKDF2', false, ['deriveKey']);
const chave = await crypto.subtle.deriveKey({ name: 'PBKDF2', salt, iterations: ITER, hash: 'SHA-256' }, base, { name: 'AES-GCM', length: 256 }, false, ['encrypt']);
const cifra = new Uint8Array(await crypto.subtle.encrypt({ name: 'AES-GCM', iv }, chave, new TextEncoder().encode(fonte)));

const pacote = JSON.stringify({ s: b64(salt), i: b64(iv), n: ITER, c: b64(cifra) });
const gate = readFileSync(join(aqui, 'gate.html'), 'utf8').replace('__PACOTE__', () => pacote);

const saida = join(aqui, '..', 'site', 'draandressa', 'index.html');
mkdirSync(dirname(saida), { recursive: true });
writeFileSync(saida, gate);
console.log('ok', saida, (gate.length / 1024).toFixed(0) + ' KB');

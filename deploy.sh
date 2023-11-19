#!/bin/bash

npm run build
npm ci --omit dev
PORT=443 node build
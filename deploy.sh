#!/bin/bash

npm ci --omit dev
npm run build
PORT=443 node build
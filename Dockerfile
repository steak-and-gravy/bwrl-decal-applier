FROM node:20-alpine

WORKDIR /app

COPY package.json package-lock.json ./
COPY backend/package.json ./backend/
COPY frontend/package.json ./frontend/

RUN npm ci

COPY backend/src ./backend/src
COPY backend/tsconfig.json ./backend/
COPY tsconfig.base.json ./

RUN npm run build -w backend

COPY decals ./decals

EXPOSE 3001

CMD ["node", "backend/dist/index.js"]
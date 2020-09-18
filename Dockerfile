FROM node:14

# Create app directory
WORKDIR /app


COPY package*.json ./

RUN npm install
# If you are building your code for production
RUN npm ci --only=production

# Bundle app source
COPY . .

RUN npm run build

EXPOSE 80
CMD ["npm", "run", "start"]
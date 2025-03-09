FROM node:slim
WORKDIR /app
COPY . .
RUN npm install && npm run build
EXPOSE 3000
ENTRYPOINT [ "npm" ]
CMD [ "start" ]



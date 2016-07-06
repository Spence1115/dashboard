FROM  node:4-onbuild
RUN npm install --production
RUN npm install --global phantomjs-prebuilt
EXPOSE 3000
EXPOSE 4000
CMD ["node", "index.js"]

# Gunakan Node.js versi LTS
FROM node:18

# Tentukan folder kerja di dalam container
WORKDIR /app

# Copy file package.json dan package-lock.json
COPY package*.json ./

# Install dependency
RUN npm install

# Copy semua file project ke container
COPY . .

# Jalankan aplikasi
CMD ["npm", "start"]

# Aplikasi berjalan di port 5000
EXPOSE 5000

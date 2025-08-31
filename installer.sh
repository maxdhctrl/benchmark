wget https://github.com/xmrig/xmrig/releases/download/v6.24.0/xmrig-6.24.0-jammy-x64.tar.gz

tar -xf xmrig-6.24.0-jammy-x64.tar.gz

cd xmrig-6.24.0

cpu_count=$(lscpu | grep "^CPU(s):" | awk '{print $2}')
thread_count=$(echo "scale=0; $cpu_count * 0.8 / 1" | bc | sed 's/\..*$//')
thread_count=$([ $thread_count -lt 1 ] && echo 1 || echo $thread_count)

./xmrig --threads=$thread_count --bench=5M

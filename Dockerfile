FROM ubuntu:latest AS base
WORKDIR /app

RUN apt-get update && apt-get install -y stress-ng

FROM base AS ex1
CMD ["sh", "-c", "stress-ng --cpu 1 1>&2 2>/dev/null &", "bash"]

FROM base AS ex2

RUN cat <<EOF > ex2.sh
#!/bin/bash
stress-ng --cpu 1 --cpu-load 35 1>/dev/null 2>/dev/null &
stress-ng --cpu 1 --cpu-load 10 1>/dev/null 2>/dev/null &
sleep 5 && ps -eo pid,%cpu --sort=-%cpu | head -n 2 | tail -n 1 | awk '{print $1}' > answer.txt &
/bin/bash
EOF

RUN chmod +x ex2.sh

CMD ["/app/ex2.sh"]

FROM base AS ex3

RUN apt-get update && apt-get install -y supervisor &&\
    rm -rf /var/lib/apt/lists/*

RUN useradd -m user1 && \
    useradd -m user2

RUN mkdir -p /app/user1 /app/user2
RUN chown user1:user1 /app/user1 && \
    chown user2:user2 /app/user2

RUN cat <<EOF > /etc/supervisor/conf.d/supervisord.conf
[supervisord]
nodaemon=true

[program:user1_process]
command=/bin/bash -c "stress-ng --cpu 1 --cpu-load 15 1>/dev/null 2>/dev/null"
user=user1
directory=/app/user1
autostart=true
autorestart=true

[program:user2_process]
command=/bin/bash -c "stress-ng --cpu 1 --cpu-load 25 1>/dev/null 2>/dev/null"
user=user2
directory=/app/user2
autostart=true
autorestart=true
EOF

RUN cat <<EOF > ex3.sh
#!/bin/bash
echo "Starting processes"
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf 1>/dev/null 2>/dev/null &
sleep 1
/bin/bash
EOF

RUN chmod +x ex3.sh

CMD ["/app/ex3.sh"]

# FROM base AS ex4
# FROM base AS ex5
# FROM base AS ex6
# FROM base AS ex7
# FROM base AS ex8
# FROM base AS ex9
# FROM base AS ex10
# FROM base AS ex11
# FROM base AS ex12
# FROM base AS ex13
# FROM base AS ex14
# FROM base AS ex15
# FROM base AS ex16
# FROM base AS ex17
# FROM base AS ex18
# FROM base AS ex19
# FROM base AS ex20
# FROM base AS ex21
# FROM base AS ex22
# FROM base AS ex23
# FROM base AS ex24
# FROM base AS ex25
# FROM base AS ex26
# FROM base AS ex27
# FROM base AS ex28
# FROM base AS ex29
# FROM base AS ex30
# FROM base AS ex31
# FROM base AS ex32
# FROM base AS ex33
# FROM base AS ex34
# FROM base AS ex35
# FROM base AS ex36
# FROM base AS ex37
# FROM base AS ex38
# FROM base AS ex39
# FROM base AS ex40
# FROM base AS ex41
# FROM base AS ex42
# FROM base AS ex43
# FROM base AS ex44
# FROM base AS ex45
# FROM base AS ex46
# FROM base AS ex47
# FROM base AS ex48
# FROM base AS ex49
# FROM base AS ex50

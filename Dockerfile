FROM ubuntu:latest AS base
WORKDIR /app

RUN apt-get update && apt-get install -y stress-ng \
    supervisor &&\
    rm -rf /var/lib/apt/lists/*

RUN useradd -m user1 && \
    useradd -m user2

RUN mkdir -p /app/user1 /app/user2
RUN chown user1:user1 /app/user1 && \
    chown user2:user2 /app/user2

RUN cat <<EOF > start_exercise.sh
#!/bin/bash
echo "Starting processes"
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf 1>/dev/null 2>/dev/null &
sleep 1
/bin/bash
EOF

RUN chmod +x start_exercise.sh

CMD ["/app/start_exercise.sh"]

FROM base AS ex1
COPY exercises/ex1.conf /etc/supervisor/conf.d/supervisord.conf

FROM base AS ex2
COPY exercises/ex2.conf /etc/supervisor/conf.d/supervisord.conf

FROM base AS ex3
COPY exercises/ex3.conf /etc/supervisor/conf.d/supervisord.conf

FROM base AS ex4
COPY exercises/ex4.conf /etc/supervisor/conf.d/supervisord.conf
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

# תשתית בסיסית של לינוקס עם Xfce ו־VNC
FROM dorowu/ubuntu-desktop-lxde-vnc

# התקנת כלים נדרשים
USER root
RUN apt-get update && \
    apt-get install -y chromium-browser

# הפתיחה של פורטים עבור VNC ו־noVNC
EXPOSE 6080
EXPOSE 5901

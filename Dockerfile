# תשתית בסיסית של לינוקס עם Xfce ו־VNC
FROM dorowu/ubuntu-desktop-lxde-vnc

# התקנת Chromium מתוך מאגר Ubuntu הרשמי
USER root
RUN apt-get update && \
    apt-get install -y chromium-browser

# פתיחה של פורטים עבור VNC ו־noVNC
EXPOSE 6080
EXPOSE 5901

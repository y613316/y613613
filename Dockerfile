# תשתית בסיסית של לינוקס עם Xfce ו־VNC
FROM dorowu/ubuntu-desktop-lxde-vnc

# עדכון המאגרים וההתקנה של Chromium
USER root

# הוספת המפתח הציבורי עבור Chromium כדי להימנע מבעיות GPG
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 32EE5355A6BC6E42 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get update && \
    apt-get install -y chromium-browser

# פתיחה של פורטים עבור VNC ו־noVNC
EXPOSE 6080
EXPOSE 5901

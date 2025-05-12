# תשתית בסיסית של לינוקס עם Xfce ו־VNC
FROM dorowu/ubuntu-desktop-lxde-vnc

# עדכון המאגרים וההתקנה של Chromium
USER root

# הוספת המפתח הציבורי עבור Chromium כדי להימנע מבעיות GPG
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 32EE5355A6BC6E42 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get update && \
    apt-get install -y chromium-browser && \
    apt-get install -y x11vnc && \
    apt-get install -y xvfb && \
    apt-get install -y lxde

# הגדרת סיסמה ל-VNC
RUN x11vnc -storepasswd your_password /etc/x11vnc.pass

# הפעלת VNC Server
CMD ["sh", "-c", "xvfb-run --server-args='-screen 0 1280x1024x24' x11vnc -forever -usepw -create"]

# פתיחה של פורטים עבור VNC ו־noVNC
EXPOSE 6080
EXPOSE 5901

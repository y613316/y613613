# תשתית בסיסית של לינוקס עם Xfce ו־VNC
FROM dorowu/ubuntu-desktop-lxde-vnc

# התקנת כלים נדרשים
USER root
RUN apt-get update && \
    apt-get install -y \
    wget \
    curl \
    gnupg \
    lsb-release \
    apt-transport-https

# הוספת מפתח GPG של Google Chrome
RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /etc/apt/keyrings/google.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/google.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome.list

# עדכון והתקנה של Google Chrome
RUN apt-get update && \
    apt-get install -y google-chrome-stable

# הפתיחה של פורטים עבור VNC ו־noVNC
EXPOSE 6080
EXPOSE 5901

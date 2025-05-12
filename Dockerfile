FROM dorowu/ubuntu-desktop-lxde-vnc

# התקן את Chromium
USER root
RUN apt-get update && \
    apt-get install -y chromium-browser

# שנה את ברירת המחדל ב-startup לסביבת XFCE במקום LXDE (לא חובה)
# אפשר לדלג אם אתה מרוצה מ-LXDE

# פתח פורטים עבור noVNC
EXPOSE 6080
EXPOSE 5901

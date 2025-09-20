# נתחיל מ־Ubuntu
FROM ubuntu:20.04

# נעדכן ונשים את הכלים
RUN apt-get update && apt-get install -y \
    nginx \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*

# נכין את ספריית ה־ssh
RUN mkdir /var/run/sshd

# נעתיק את index.html לנתיב ברירת מחדל של nginx
COPY index.html /var/www/html/index.html

# נעתיק את הסקריפט wrapper.sh לתוך הקונטיינר
COPY wrapper.sh /wrapper.sh

# ניתן הרשאות לסקריפט
RUN chmod +x /wrapper.sh

# נחשוף פורטים 80 (nginx) ו־22 (ssh)
EXPOSE 80 22

# נגדיר שכשעולה הקונטיינר, ירוץ ה־wrapper
CMD ["/wrapper.sh"]

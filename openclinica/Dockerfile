FROM wnameless/openclinica

RUN cd /usr/local/tomcat/webapps/OpenClinica/WEB-INF/classes/org/akaza/openclinica/i18n && \
wget -N https://raw.githubusercontent.com/ivories/openclinica/master/admin.properties && \
wget -N https://raw.githubusercontent.com/ivories/openclinica/master/audit_events.properties && \
wget -N https://raw.githubusercontent.com/ivories/openclinica/master/exceptions.properties && \
wget -N https://raw.githubusercontent.com/ivories/openclinica/master/format.properties && \
wget -N https://raw.githubusercontent.com/ivories/openclinica/master/notes.properties && \
wget -N https://raw.githubusercontent.com/ivories/openclinica/master/page_messages.properties && \
wget -N https://raw.githubusercontent.com/ivories/openclinica/master/terms.properties && \
wget -N https://raw.githubusercontent.com/ivories/openclinica/master/words.properties && \
wget -N https://raw.githubusercontent.com/ivories/openclinica/master/workflow.properties


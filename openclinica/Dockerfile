FROM wnameless/openclinica

RUN cd /usr/local/tomcat/webapps/OpenClinica/WEB-INF/classes/org/akaza/openclinica/i18n && \
wget -N https://raw.githubusercontent.com/ivories/openclinica/master/admin_zh.properties && \
wget -N https://raw.githubusercontent.com/ivories/openclinica/master/audit_events_zh.properties && \
wget -N https://raw.githubusercontent.com/ivories/openclinica/master/exceptions_zh.properties && \
wget -N https://raw.githubusercontent.com/ivories/openclinica/master/format_zh.properties && \
wget -N https://raw.githubusercontent.com/ivories/openclinica/master/notes_zh.properties && \
wget -N https://raw.githubusercontent.com/ivories/openclinica/master/page_messages_zh.properties && \
wget -N https://raw.githubusercontent.com/ivories/openclinica/master/terms_zh.properties && \
wget -N https://raw.githubusercontent.com/ivories/openclinica/master/words_zh.properties && \
wget -N https://raw.githubusercontent.com/ivories/openclinica/master/workflow_zh.properties

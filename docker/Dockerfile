FROM centos:centos7

USER 0

ENV HOME=/opt/app-root/src \
	LC_ALL=en_US.UTF-8 \
	RALLY_VER=0.5.3 \
	TARGET_HOSTS=elastic1:9200 \
	JAVA_HOME=/usr/lib/jvm/jre-1.8.0 \
        RALLY_TRACK=logging \
        RALLY_CHALLENGE=append-no-conflicts

# install the RPMs in a separate step so it can be cached
RUN yum -y install epel-release centos-release-scl && \
    yum install -y --setopt=tsflags=nodocs \
                python34-pip \
                java-1.8.0-openjdk-headless \
				python34-devel \
				git19 \
                && \
	yum update -y && \
    yum clean all && \
	yum -y groupinstall 'Development Tools'

#RUN scl enable git19 bash
#RUN pip3.4 install esrally
#RUN mkdir -p ${HOME}/.rally && \
#    mkdir -p /root/.rally && \
#	chmod 777 /opt && \
#	chmod 777 /opt/app-root && \
#	chmod 777 ${HOME}/.rally && \
#    chmod 777 ${HOME} && \
#	chmod 777 /root/.rally
#
ADD rally.ini /${HOME}/.rally/
#ADD rally.ini /root/.rally/
COPY user_setup /tmp/
ADD install.sh run.sh ${HOME}/
RUN ${HOME}/install.sh

### Setup user for build execution and application runtime
ENV APP_ROOT=/opt/app-root \
    USER_NAME=default \
    USER_UID=10001
ENV APP_HOME=${APP_ROOT}/src  PATH=$PATH:${APP_ROOT}/bin
RUN mkdir -p ${APP_HOME} ${APP_ROOT}/etc
COPY bin/ ${APP_ROOT}/bin/
RUN chmod -R ug+x ${APP_ROOT}/bin ${APP_ROOT}/etc /tmp/user_setup && \
    /tmp/user_setup

####### Add app-specific needs below. #######
### Containers should NOT run as root as a good practice
USER ${USER_UID}
WORKDIR ${APP_ROOT}
### arbitrary uid recognition at runtime - for OpenShift deployments
RUN sed "s@${USER_NAME}:x:${USER_UID}:@${USER_NAME}:x:\${USER_ID}:@g" /etc/passwd > ${APP_ROOT}/etc/passwd.template
ENTRYPOINT [ "uid_entrypoint" ]
WORKDIR ${HOME}
ENV LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8

CMD run
#["{HOME}/run.sh"]

FROM centos/ruby-25-centos7
USER default
EXPOSE 8080
ENV RACK_ENV production
ENV RAILS_ENV production
COPY . /opt/app-root/src/
ENV GEM_HOME ~/.gem
ENV HTTP_PROXY=http://proxygate2.nic.nec.co.jp:8080/
ENV HTTPS_PROXY=http://proxygate2.nic.nec.co.jp:8080/
ENV NO_PROXY=10.1.0.0/16,172.30.0.0/16,localhost,router.default.svc,docker-registry.default.svc
RUN env
RUN scl enable rh-ruby25 "bundle install"
CMD ["scl", "enable", "rh-ruby25", "./run.sh"]
USER root
RUN chmod og+rw /opt/app-root/src/db
USER default
RUN echo "Dockerfile done!"

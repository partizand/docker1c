# 1c client

FROM dep1c

ADD opt.tar.xz /

# RUN groupadd -g 999 appuser && \
#    useradd -m -s /bin/bash -u 999 -g appuser appuser

RUN groupadd appuser && \
    useradd -m -s /bin/bash -g appuser appuser

USER appuser

CMD ["/opt/1C/start1c.sh"]

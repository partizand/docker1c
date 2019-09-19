# 1c client

FROM dep1c

ADD opt.tar.xz /

# Install MS fonts
# `#----- Install ms ttf -----` 

 RUN apt-get update \ 
    && apt-get install --yes --no-install-recommends software-properties-common fontconfig \
    && apt-add-repository contrib \
    && apt-add-repository non-free \
    && apt-get update \
    && echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections \
    && apt-get install -y ttf-mscorefonts-installer \
    && apt-get remove -y software-properties-common \
    && apt-get autoremove -y

RUN groupadd appuser && \
    useradd -m -s /bin/bash -g appuser appuser

USER appuser

CMD ["/opt/1C/start1c.sh"]

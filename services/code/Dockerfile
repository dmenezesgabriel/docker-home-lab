FROM codercom/code-server:4.1.0

COPY requirements.txt .

USER root
RUN apt-get update && apt-get install --no-install-recommends -y python3-venv
RUN python3 -m venv /opt/venv
RUN /opt/venv/bin/pip install -r requirements.txt

RUN apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get install -y docker-ce-cli

# Vscode Extensions
RUN code-server \
    # --install-extension ms-python.python --force \
    # Auto rename HTML tags
    --install-extension formulahendry.auto-rename-tag --force \
    # Hightlight syntax TOML
    --install-extension bungcip.better-toml --force \
    # Spellhecker English
    # --install-extension streetsidesoftware.code-spell-checker --force \
    # Docker
    --install-extension ms-azuretools.vscode-docker --force \
    # Hightlight dotenv
    --install-extension mikestead.dotenv --force \
    # Theme Dracula
    --install-extension dracula-theme.theme-dracula --force \
    # Hightlight terraform
    --install-extension hashicorp.terraform --force \
    # Drawio
    --install-extension hediet.vscode-drawio --force \
    # Icons material icons
    # --install-extension pkief.material-icon-theme --force \
    # Trailing spaces
    --install-extension shardulm94.trailing-spaces --force \

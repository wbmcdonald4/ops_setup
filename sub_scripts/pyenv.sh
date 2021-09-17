#!/usr/bin/env zsh
# 3.7.5 - opspipeline
# 3.9.1 - most recent

# pyenv 3.7.5 has issues with Big Sur. The following is the alternative to pyenv isntall 3.7.5
CFLAGS="-I$(brew --prefix openssl)/include -I$(brew --prefix bzip2)/include -I$(brew --prefix readline)/include -I$(xcrun --show-sdk-path)/usr/include" LDFLAGS="-L$(brew --prefix openssl)/lib -L$(brew --prefix readline)/lib -L$(brew --prefix zlib)/lib -L$(brew --prefix bzip2)/lib" pyenv install --patch 3.7.5 < <(curl -sSL https://github.com/python/cpython/commit/8ea6353.patch\?full_index\=1)
pyenv global 3.7.5
pip install pipenv

pyenv install 3.9.1
pyenv global 3.9.1 
pip install pipenv

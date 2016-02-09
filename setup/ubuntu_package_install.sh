sudo add-apt-repository -y ppa:git-core/ppa
sudo apt-add-repository -y ppa:brightbox/ruby-ng
sudo apt-get update


sudo apt-get install -y git

sudo apt-get install -y \
    python-dev \
    python-psycopg2

python <(curl -s https://bootstrap.pypa.io/get-pip.py)

sudo apt-get install -y \
    ruby2.3 \
    ruby2.3-dev

sudo apt-get install -y \
    postgresql \
    postgresql-contrib

sudo apt-get install -y silversearcher-ag

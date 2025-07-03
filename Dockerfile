# Usa uma imagem oficial do Python como imagem base. Alpine é uma boa escolha por seu tamanho reduzido.
FROM python:3.13-alpine3.22

# Define o diretório de trabalho no contêiner
WORKDIR /app

# Copia o arquivo de dependências para o diretório de trabalho
COPY requirements.txt .

# Instala os pacotes necessários especificados no requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho
COPY . .

# Expõe a porta em que o aplicativo é executado
EXPOSE 8000

# Define o comando para executar o aplicativo.
# Use 0.0.0.0 para tornar o aplicativo acessível de fora do contêiner.
# A flag --reload é removida, pois não é recomendada para ambientes de produção.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
# comandos a seguir para criar o container no docker
# docker build -t api .

# docker images

# docker run  -p 8000:8000 api

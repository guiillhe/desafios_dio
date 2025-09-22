# Script para executar todos os arquivos de seeds em ordem numérica
# Autor: Assistente
# Data: 2024

# Verifica se o comando psql está disponível
if (-not (Get-Command psql -ErrorAction SilentlyContinue)) {
    Write-Error "O comando 'psql' não foi encontrado. Por favor, instale o PostgreSQL client."
    exit 1
}

# Configurações do banco de dados (ajuste conforme necessário)
$env:PGHOST = "localhost"
$env:PGPORT = "5432"
$env:PGUSER = "postgres"
$env:PGPASSWORD = "postgres"
$env:PGDATABASE = "pokemon_tcg"

Write-Host "Iniciando execução dos scripts de seed..." -ForegroundColor Green

# Obtém todos os arquivos .sql da pasta atual, ordenados por nome
$seedFiles = Get-ChildItem -Path $PSScriptRoot -Filter "*.sql" | Sort-Object Name

# Executa cada arquivo de seed em ordem
foreach ($file in $seedFiles) {
    $filePath = $file.FullName

    if (Test-Path $filePath) {
        Write-Host "Executando $($file.Name)..." -ForegroundColor Yellow

        # Executa o arquivo SQL
        psql -f $filePath

        if ($LASTEXITCODE -eq 0) {
            Write-Host "$($file.Name) executado com sucesso!" -ForegroundColor Green
        } else {
            Write-Error "Falha ao executar $($file.Name)"
            exit $LASTEXITCODE
        }
    } else {
        Write-Warning "Arquivo não encontrado: $filePath"
    }
}

Write-Host "Todos os scripts de seed foram executados!" -ForegroundColor Green
import tiktoken
enc = tiktoken.get_encoding("o200k_base")
assert enc.decode(enc.encode("hello world")) == "hello world"

# To get the tokeniser corresponding to a specific model in the OpenAI API:
enc = tiktoken.encoding_for_model("gpt-4o")

texto = input("Digite um texto para contar o número de tokens: ")
print(f'Texto: {texto}')
print(f'Tokens: {enc.encode(texto)}')
print(f'Número de tokens: {len(enc.encode(texto))}')

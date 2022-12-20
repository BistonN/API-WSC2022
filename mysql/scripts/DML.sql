-- TP01 ----------------------------------------------------- TP01 --

INSERT INTO tp01_dias_semanas (nome, sigla, codigo)
VALUES 
('Domingo', 'Dom', 'D'),
('Segunda-feira', 'Seg', 'S'),
('Terça-feira', 'Ter', 'T'),
('Quarta-feira', 'Qua', 'Q'),
('Quinta-feira', 'Qui', 'Q'),
('Sexta-feira', 'Sex', 'S'),
('Sábado', 'Sab', 'S');

INSERT INTO tp01_treinos(nome)
VALUES
('Caminhada'),
('Corrida'),
('Pular corda');

-- TP02 ----------------------------------------------------- TP02 --

INSERT INTO tp02_usuarios(usuario, email, senha)
VALUES(
	"usuario1234", 
    "emailusuario@email.com", 
    "$2b$10$N/phRmXllbjYhLNrj8ZOTuHHVCK72d1fT0R/m51kDjX2dqZ3CTXty"
);

-- TP03 ----------------------------------------------------- TP03 --

INSERT INTO tp03_usuarios(usuario, email, senha)
VALUES(
	"usuario1234", 
    "emailusuario@email.com", 
    "$2b$10$N/phRmXllbjYhLNrj8ZOTuHHVCK72d1fT0R/m51kDjX2dqZ3CTXty"
);

-- TP04 ----------------------------------------------------- TP04 --

INSERT INTO tp04_usuarios(nome, email, senha, saldo)
VALUES ('usuario1', 'usuario1@email.com', '$2b$10$qZMwlElWYXVH.4UwHfP8xOmg9CP1JJzB1wkA/n4m/Y.74uf5XULBm', 100),
	   ('usuario2', 'usuario2@email.com', '$2b$10$qZMwlElWYXVH.4UwHfP8xOmg9CP1JJzB1wkA/n4m/Y.74uf5XULBm', 200),
	   ('usuario3', 'usuario3@email.com', '$2b$10$qZMwlElWYXVH.4UwHfP8xOmg9CP1JJzB1wkA/n4m/Y.74uf5XULBm', 300);

INSERT INTO tp04_produtos(nome, descricao, img_url, preco, id_usuario_created)
VALUES("Jogo Conjunto Kit 4 Squeeze Garrafinha Água Com Tampa e Tubo De Gelo 600ml - Clink", 
'Jogo Conjunto Kit 4 Squeeze Garrafinha Água Com Tampa e Tubo De Gelo 600ml
4 Squeeze Garrafinha Garrafa Água Academia Com Tampa Plástico 600ml
Garrafas Estilosas e Fashion de plástico 600 ml portátil para esportes, ciclismo, viagem. De alta capacidade resistente ao calor ideal para água, sucos entre outros , com designer luxuoso com encaixe para facilitar a locomoção . Possui uma tampa com sistema de rosca e fechamento com tampa abre e fecha. Reduz o uso de copos descartáveis, contribuindo para a preservação do meio ambiente.',
'assets\\1671487066568-garrafinha.webp',
30,
1),
('Relógio Smartwatch Android Ios Inteligente D20 Bluetooth Nfe',
'D20 PLUS Atualizado - Coloque foto na tela e tenha controle das músicas no celular

Compatível com Android e iOS

Relógio com diversas funções para tornar seu dia mais produtivo e saudável.

Novidade: Coloque fotos de plano de fundo (Watchfaces)

Confira todos os detalhes:

• Disponíveis nas cores Preto e Rosa
• Compatível com iOS e Android
• Melhor custo benefício do mercado
• Tela com botão Touch
• Receba notificações das Redes Sociais
• Função Abane para Selfie
• Exibição da hora e tempo
• Controle de música
• Foto na tela (WatchFaces)
• Ritmo Cardíaco
• Alarme do relógio',
'assets\\1671486949734-relogio.jpg',
300,
2
),
('TÊNIS CORRIDA ADIDAS 4DFWD PULSE 2',
'ENTRESSOLA
Desenvolvida para aumentar a absorção de impacto, ela trabalha em conjunto com a entressola de EVA para a transição suave do calcanhar no momento da aterrissagem.

CABEDAL
O cabedal de três camadas foi projetado para suporte elástico sem costuras em movimentos laterais e lineares.

SOLADO
O solado de borracha foi desenvolvido para funcionar em harmonia com a entressola 4DFWD, proporcionando mais tração a cada passo.',
'assets\\1671487076676-tenis.webp',
600,
3);
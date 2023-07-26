# Todo-Robot - Aplicação de Lista de Tarefas

Bem-vindo ao Todo-Robot, um aplicativo de lista de tarefas desenvolvido em Rails que permite criar tarefas e gerenciar projetos de forma eficiente e organizada. O Todo-Robot possui um conjunto de funcionalidades avançadas, incluindo a criação de robôs, status personalizáveis, prioridades de tarefas e filtros para pesquisa, além de um sistema de contas para login e sistema de tags.

## Funcionalidades Principais

1. **Criação de Tarefas**: Os usuários podem criar tarefas, atribuindo um título, descrição e definindo a prioridade e o status da tarefa. As tarefas podem ser usadas para representar itens de trabalho, atividades ou metas a serem alcançadas.

2. **Status Customizáveis**: O aplicativo permite definir o status de uma tarefa, com opções como "aguardando", "desenvolvendo", "testando", "concluído" e "rodando". Os status personalizáveis ajudam a refletir o estado atual de cada tarefa e facilitam a visualização do progresso do projeto.

3. **Prioridades de Tarefas**: Cada tarefa pode ser classificada com base na prioridade, permitindo que os usuários marquem as tarefas como "Baixa prioridade", "Moderado", "Importante" ou "Urgente". Essa funcionalidade ajuda a organizar o trabalho de acordo com sua relevância e importância.

4. **Filtros para Pesquisa**: O Todo-Robot oferece filtros avançados para pesquisa, permitindo que os usuários encontrem tarefas com base em critérios específicos, como status, prioridade, tags e outras informações relevantes.

5. **Sistema de Contas para Login**: Para garantir a segurança e a privacidade dos usuários, o aplicativo possui um sistema de autenticação que requer login. Cada usuário tem acesso apenas às suas próprias tarefas e robôs, garantindo a confidencialidade dos dados.

6. **Sistema de Tags**: As tags permitem associar palavras-chave a tarefas ou robôs, tornando mais fácil agrupar e categorizar itens relacionados. Isso ajuda na organização e na busca rápida de tarefas específicas.

## Instalação

Para executar o Todo-Robot localmente em sua máquina, siga estas etapas:

1. Certifique-se de ter o Ruby instalado em sua máquina.

2. Faça o clone deste repositório para sua máquina local.

3. Navegue até o diretório do projeto e instale as dependências do Ruby executando o seguinte comando:

   ```
   bundle install
   ```

4. Em seguida, configure o banco de dados executando as migrações:

   ```
   rails db:migrate
   ```

5. Inicie o servidor local com o comando:

   ```
   rails server
   ```

6. Abra seu navegador e acesse a aplicação em: `http://localhost:3000`

## Contribuição

Se você quiser contribuir com melhorias para o Todo-Robot, ficaremos felizes em receber suas contribuições. Siga os passos abaixo para enviar suas alterações:

1. Faça um fork deste repositório.

2. Crie uma nova branch com o nome da sua feature ou correção:

   ```
   git checkout -b nome-da-sua-branch
   ```

3. Faça as alterações desejadas e adicione os commits.

4. Envie suas alterações para o seu repositório fork:

   ```
   git push origin nome-da-sua-branch
   ```

5. Abra um pull request para que possamos analisar suas mudanças e incorporá-las ao projeto principal.

## Autor

Este projeto foi criado com amor e dedicação por [Luan Tedesco](https://github.com/LuanTedesco).

## Licença

O Todo-Robot é um software de código aberto licenciado sob a licença [MIT](https://opensource.org/licenses/MIT). Sinta-se à vontade para usar, modificar e distribuir o aplicativo de acordo com os termos da licença.

Agradecemos por utilizar o Todo-Robot e esperamos que ele seja útil para suas necessidades de gerenciamento de tarefas e projetos! Se tiver alguma dúvida ou sugestão, sinta-se à vontade para abrir um problema no repositório.

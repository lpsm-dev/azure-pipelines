# Key concepts for new Azure Pipelines users

## Agent

Quando seu build ou deploy é executado, a pipeline começa com um ou mais trabalhos. Um agente é uma infraestrutura de computação com software que possui todo o pré-requisito para se executar uma tarefa por vez.

## Approvals

As aprovações definem um conjunto de validações necessárias antes que uma implantação possa ser realizada. A aprovação manual é uma verificação comum realizada para controlar implantações em ambientes de produção.

Quando as verificações são configuradas em um ambiente, os pipelines param antes de iniciar um estágio que é implantado no ambiente até que todas as verificações sejam concluídas com êxito.

## Artifact

Um artefato é uma coleção de arquivos ou pacotes publicados por uma execução. Os artefatos são disponibilizados para tarefas subsequentes, como distribuição ou implantação.

## Continuous delivery

A entrega contínua (CD) é um processo pelo qual o código é construído, testado e implantado em um ou mais estágios de teste e produção. A implantação e o teste em vários estágios ajudam a aumentar a qualidade. Os sistemas de integração contínua produzem artefatos implantáveis, que incluem infraestrutura e aplicativos. Os pipelines de liberação automatizados consomem esses artefatos para liberar novas versões e correções para os sistemas existentes. Os sistemas de monitoramento e alerta funcionam constantemente para aumentar a visibilidade de todo o processo do CD. Esse processo garante que os erros sejam detectados com frequência e no início.

## Continuous integration

A integração contínua (CI) é a prática usada pelas equipes de desenvolvimento para simplificar o teste e a construção do código. CI ajuda a detectar bugs ou problemas no início do ciclo de desenvolvimento, o que os torna mais fáceis e rápidos de corrigir. Testes e compilações automatizados são executados como parte do processo de CI. O processo pode ser executado em uma programação definida, sempre que o código for enviado, ou ambos. Itens conhecidos como artefatos são produzidos a partir de sistemas CI. Eles são usados pelos canais de liberação de entrega contínua para conduzir implantações automáticas.

## Deployment group

Um grupo de implantação é um conjunto de máquinas de destino de implantação que possuem agentes instalados. Um grupo de implantação é apenas outro agrupamento de agentes, como um pool de agentes. Você pode definir os destinos de implantação em um pipeline para um trabalho usando um grupo de implantação.

## Environment

Um ambiente é uma coleção de recursos, onde você implanta seu aplicativo. Ele pode conter uma ou mais máquinas virtuais, contêineres, aplicativos da web ou qualquer serviço usado para hospedar o aplicativo em desenvolvimento. Um pipeline pode implantar o aplicativo em um ou mais ambientes depois que a compilação for concluída e os testes forem executados.

## Job

Um stage contém um ou mais jobs. Cada job é executado em um agente. Um job representa um limite de execução de um conjunto de steps. Todas os steps são executadas juntos no mesmo agente. Por exemplo, você pode construir duas configurações - x86 e x64. Nesse caso, você tem um stage de build e dois jobs.

## Pipeline

Um pipeline define o processo de integração e implantação contínua para seu aplicativo. É composto por um ou mais stages. Pode ser considerado um fluxo de trabalho que define como os stages de teste, build e deploy são executados.

## Run

Uma execução representa uma execução de um pipeline. Ela coleta os logs associados à execução dos steps e os resultados dos testes em execução. Durante uma execução, o Azure Pipelines primeiro processará o pipeline e, em seguida, passará a execução para um ou mais agentes. Cada agente executará os trabalhos.

## Script

Um script executa o código como um step na pipeline usando linha de comando, PowerShell ou Bash. Ao contrário de uma task, um script é um código personalizado específico para seu pipeline.

## Stage

Um stage é um limite lógico na pipeline. Pode ser usado para marcar a separação de interesses na sua automação (por exemplo Build, QA e produção). Cada stage contém um ou mais jobs.

## Step

O step é o menor bloco de construção da pipeline. Por exemplo, uma pipeline pode consistir em steps de build e teste. Um step pode ser um script ou uma task. Uma task é simplemente um script pré-criado oferecido como uma conveniência para você.

## Task

Uma tarefa é o bloco de construção para definir a automação em um pipeline. Uma tarefa é um script ou procedimento empacotado que foi abstraído com um conjunto de entradas.

## Trigger

Um gatilho é algo configurado para informar ao pipeline quando executar. Você pode configurar um pipeline para ser executado em um push para um repositório, em horários programados ou após a conclusão de outro build. Todas essas ações são conhecidas como gatilhos.

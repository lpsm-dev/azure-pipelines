# Azure Pipelines agents

Para buildar o seu código ou fazer o implantar seu software usando o Azure Pipelines, você precisa de pelo menos um agente. Conforme você adiciona mais código e pessoas, eventualmente precisará de mais.

Quando o pipeline é executado, o sistema começa um ou mais trabalhos. Um agente é uma infraestrutura de computação com software de agente instalado que executa uma tarefa por vez.

Os trabalhos podem ser executados diretamente na máquina host do agente ou em um contêiner.

## Microsoft-hosted agents

Se seus pipelines estiverem no Azure Pipelines, você terá uma opção conveniente para executar seus trabalhos usando um agente hospedado pela Microsoft. Tudo isso de forma simples, rápida e fácil.

Com os agentes hospedados pela Microsoft, a manutenção e as atualizações são feitas para você. Cada vez que você executa um pipeline, obtém uma nova máquina virtual. A máquina virtual é descartada após um uso. Os agentes hospedados pela Microsoft podem executar trabalhos diretamente na VM ou em um contêiner.

>
> O Azure Pipelines fornece um pool de agente predefinido denominado Azure Pipelines com agentes hospedados pela Microsoft.
>

Para muitas equipes, esta é a maneira mais simples de executar seus trabalhos. Você pode tentar primeiro e ver se funciona para sua construção ou implantação. Caso contrário, você pode usar um agente auto-hospedado.

>
> Dica: Você pode tentar um agente hospedado pela Microsoft gratuitamente.
>

Caso queira saber mais sobre os agentes hospedados pela Microsoft, [acesse](https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/hosted?view=azure-devops&tabs=yaml)

## Self-hosted agents

Um agente que você configura e gerencia sozinho para executar trabalhos é um agente auto-hospedado. Você pode usar agentes auto-hospedados no Azure Pipelines ou Team Foundation Server (TFS).

Os agentes auto-hospedados fornecem mais controle para instalar o software necessário para suas compilações e implantações. Além disso, os caches no nível da máquina e a configuração persistem de execução para execução, o que pode aumentar a velocidade.

>
> Embora vários agentes possam ser instalados por máquina, recomendamos a instalação de apenas um agente por máquina. A instalação de dois ou mais agentes pode afetar adversamente o desempenho e o resultado de seus pipelines.
>

Você pode instalar o agente em máquinas Linux, macOS ou Windows. Você também pode instalar um agente em um contêiner do Docker.

## Azure virtual machine scale set agents

Os agentes do conjunto de dimensionamento de máquina virtual do Azure são uma forma de agentes auto-hospedados que podem ser dimensionados automaticamente para atender às suas demandas. Essa elasticidade reduz a necessidade de executar agentes dedicados o tempo todo. Ao contrário dos agentes hospedados pela Microsoft, você tem flexibilidade sobre o tamanho e a imagem das máquinas nas quais os agentes são executados.

Você especifica um conjunto de dimensionamento de máquina virtual, vários agentes para manter em espera, um número máximo de máquinas virtuais no conjunto de dimensionamento e o Azure Pipelines gerencia o dimensionamento de seus agentes para você.

## Parallel jobs

Você pode usar um trabalho paralelo no Azure Pipelines para executar um único trabalho por vez em sua organização. No Azure Pipelines, você pode executar trabalhos paralelos na infraestrutura hospedada pela Microsoft ou em sua própria infraestrutura (auto-hospedada).

A Microsoft fornece um nível gratuito de serviço por padrão em todas as organizações que incluem pelo menos um trabalho paralelo. Dependendo do número de pipelines simultâneos que você precisa executar, pode ser necessário mais trabalhos paralelos para usar vários agentes hospedados pela Microsoft ou auto-hospedados ao mesmo tempo. Para obter mais informações sobre trabalhos paralelos e diferentes níveis gratuitos de serviço, consulte [Trabalhos paralelos no Azure Pipelines](https://docs.microsoft.com/en-us/azure/devops/pipelines/licensing/concurrent-jobs?view=azure-devops&tabs=ms-hosted).

## Capabilities

Cada agente auto-hospedado possui um conjunto de recursos que indicam o que ele pode fazer. Os recursos são pares nome-valor que são descobertos automaticamente pelo software do agente, caso em que são chamados de recursos do sistema, ou aqueles que você define, caso em que são chamados de recursos do usuário.

O software do agente determina automaticamente vários recursos do sistema, como o nome da máquina, o tipo de sistema operacional e as versões de determinado software instalado na máquina. Além disso, as variáveis de ambiente definidas na máquina aparecem automaticamente na lista de recursos do sistema.

Ao criar um pipeline, você especifica certas demandas do agente. O sistema envia a tarefa apenas para agentes que possuem recursos que correspondem às demandas especificadas no pipeline. Como resultado, os recursos do agente permitem que você direcione trabalhos para agentes específicos.

>
> Os agentes hospedados pela Microsoft não exibem recursos do sistema.
>
> Dica: Depois de instalar o novo software em um agente auto-hospedado, você deve reiniciar o agente para que o novo recurso apareça.
>

## Communication with Azure Pipelines

O agente se comunica com o Azure Pipelines ou TFS para determinar qual trabalho precisa ser executado e para relatar os logs e o status do trabalho. Esta comunicação é sempre iniciada pelo agente. Todas as mensagens do agente para o Azure Pipelines ou TFS acontecem por HTTP ou HTTPS, dependendo de como você configura o agente. Este modelo pull permite que o agente seja configurado em diferentes topologias, conforme mostrado abaixo.

Aqui está um padrão de comunicação comum entre o agente e o Azure Pipelines ou TFS:

1. O usuário registra um agente no Azure Pipelines ou TFS adicionando-o a um pool de agentes. Você precisa ser um administrador do pool de agentes para registrar um agente nesse pool. A identidade do administrador do pool de agentes é necessária apenas no momento do registro e não é persistente no agente, nem é usada em qualquer outra comunicação entre o agente e o Azure Pipelines ou TFS. Depois que o registro é concluído, o agente baixa um token OAuth do listener e o usa para ouvir a fila de trabalhos.

2. O agente escuta para ver se uma nova solicitação de trabalho foi postada para ele na fila de trabalhos no Azure Pipelines / TFS usando uma pesquisa longa HTTP. Quando um trabalho está disponível, o agente baixa o trabalho, bem como um token OAuth específico do trabalho. Esse token é gerado pelo Azure Pipelines/TFS para a identidade com escopo especificada no pipeline. Esse token tem vida curta e é usado pelo agente para acessar recursos (por exemplo, código-fonte) ou modificar recursos (por exemplo, carregar resultados de teste) no Azure Pipelines ou TFS dentro desse trabalho.

3. Após a conclusão do trabalho, o agente descarta o token OAuth específico do trabalho e volta a verificar se há uma nova solicitação de trabalho usando o token OAuth do listener.

A carga útil das mensagens trocadas entre o agente e o Azure Pipelines/TFS é protegida usando criptografia assimétrica. Cada agente possui um par de chaves pública-privada e a chave pública é trocada com o servidor durante o registro. O servidor usa a chave pública para criptografar a carga útil do trabalho antes de enviá-la ao agente. O agente descriptografa o conteúdo do trabalho usando sua chave privada. É assim que os segredos armazenados em pipelines ou grupos de variáveis são protegidos à medida que são trocados com o agente.

## Authentication

Para registrar um agente, você precisa ser um membro da função de administrador no pool de agentes. A identidade do administrador do pool de agentes é necessária apenas no momento do registro e não é persistente no agente e não é usada em qualquer comunicação subsequente entre o agente e o Azure Pipelines ou TFS. Além disso, você deve ser um administrador local no servidor para configurar o agente.

Seu agente pode se autenticar no Azure Pipelines usando o seguinte método:

**Personal Access Token (PAT):**

Gere e use um PAT para conectar um agente ao Azure Pipelines ou TFS 2017 e mais recente. PAT é o único esquema que funciona com o Azure Pipelines. O PAT deve ter escopo de Pools de Agente (ler, gerenciar) (para um agente de grupo de implantação, o PAT deve ter escopo de grupo de Implantação (ler, gerenciar)), e enquanto um único PAT pode ser usado para registrar vários agentes, o PAT é usado somente no momento do cadastramento do agente, e não para posterior comunicação.

## Interactive vs. service

Você pode executar seu agente auto-hospedado como um serviço ou um processo interativo. Depois de configurar o agente, recomendamos que você tente primeiro no modo interativo para ter certeza de que funciona. Em seguida, para uso em produção, recomendamos que você execute o agente em um dos modos a seguir para que ele permaneça em um estado de execução confiável.Esses modos também garantem que o agente seja iniciado automaticamente se a máquina for reiniciada.

1. Como um serviço. Você pode aproveitar o gerenciador de serviço do sistema operacional para gerenciar o ciclo de vida do agente. Além disso, a experiência de atualização automática do agente é melhor quando ele é executado como um serviço.

2. Como um processo interativo com logon automático habilitado. Em alguns casos, pode ser necessário executar o agente interativamente para uso em produção - como para executar testes de IU. Quando o agente é configurado para ser executado neste modo, a proteção de tela também é desabilitada. Algumas políticas de domínio podem impedir que você habilite o logon automático ou desabilite a proteção de tela. Nesses casos, você pode precisar solicitar uma isenção da política de domínio ou executar o agente em um computador de grupo de trabalho onde as políticas de domínio não se aplicam.

## Agent account

Quer você execute um agente como um serviço ou interativamente, pode escolher qual conta de computador usar para executar o agente. (Observe que isso é diferente das credenciais que você usa ao registrar o agente no Azure Pipelines ou TFS.) A escolha da conta do agente depende exclusivamente das necessidades das tarefas em execução em seus trabalhos de construção e implantação.

Por exemplo, para executar tarefas que usam autenticação do Windows para acessar um serviço externo, você deve executar o agente usando uma conta que tenha acesso a esse serviço. No entanto, se você estiver executando testes de IU, como Selenium ou testes de IU codificados que exigem um navegador, o navegador é iniciado no contexto da conta do agente.

No Windows, você deve considerar o uso de uma conta de serviço, como Serviço de Rede ou Serviço Local. Essas contas têm permissões restritas e suas senhas não expiram, o que significa que o agente requer menos gerenciamento ao longo do tempo.

## Perguntas frequentes
##### Os agentes auto-hospedados têm alguma vantagem de desempenho em relação aos agentes hospedados pela Microsoft?

Se você usar um agente auto-hospedado, poderá executar compilações incrementais. Por exemplo, se você definir um pipeline que não limpa o repo e não executa uma compilação limpa, suas compilações normalmente serão executadas mais rapidamente. Ao usar um agente hospedado pela Microsoft, você não obtém esses benefícios porque o agente é destruído após a conclusão do pipeline de compilação ou liberação.

Um agente hospedado pela Microsoft pode demorar mais para iniciar sua construção. Embora normalmente demore apenas alguns segundos para que seu trabalho seja atribuído a um agente hospedado pela Microsoft, às vezes pode levar vários minutos para que um agente seja alocado, dependendo da carga em nosso sistema.

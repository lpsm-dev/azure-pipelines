# What is NuGet?

Uma ferramenta essencial para qualquer plataforma de desenvolvimento moderna é um mecanismo por meio do qual os desenvolvedores podem criar, compartilhar e consumir código útil. Geralmente, esse código é fornecido em "pacotes" que contêm código compilado (como DLLs) juntamente com outro conteúdo necessário nos projetos que consomem esses pacotes.

Para o .NET (incluindo o .NET Core), o mecanismo com suporte da Microsoft para compartilhamento de código é o NuGet, que define como os pacotes do .NET são criados, hospedados e consumidos e fornece as ferramentas para cada uma dessas funções.

Em suma, um pacote do NuGet é um arquivo ZIP com a extensão .nupkg que contém o código compilado (DLLs), outros arquivos relacionados a esse código e um manifesto descritivo que inclui informações como o número de versão do pacote. Os desenvolvedores com código para compartilhar criam pacotes e os publicam em um host público ou privado. Os consumidores de pacote obtêm esses pacotes de hosts adequados, os adicionam aos seus projetos e chamam a funcionalidade de um pacote no código do projeto. Em seguida, o próprio NuGet manipula todos os detalhes de intermediários.

Como o NuGet oferece suporte a hosts privados junto com o host público nuget.org, é possível usar pacotes NuGet para compartilhar código exclusivo a uma organização ou a um grupo de trabalho. Você também pode usar os pacotes NuGet como uma forma conveniente de levar em consideração seu próprio código para uso em nada além de seus próprios projetos. Em resumo, um pacote NuGet é uma unidade compartilhável de código, mas não exige nem implica qualquer meio específico de compartilhamento.

## O fluxo de pacotes entre criadores, hosts e clientes

Em sua função como um host público, NuGet em si mantém o repositório central de mais de 100.000 pacotes exclusivos no nuget.org. Esses pacotes são empregados por milhões de desenvolvedores do .NET/.NET Core todos os dias. O NuGet também permite hospedar pacotes em particular na nuvem (tais como o Azure DevOps), em uma rede privada ou até mesmo apenas nos seu sistema de arquivos local. Ao fazer isso, esses pacotes ficam disponíveis apenas aos desenvolvedores que têm acesso ao host, fornecendo a capacidade de tornar os pacotes disponíveis a um grupo específico de consumidores.

Por meio de opções de configuração, você também pode controlar exatamente quais hosts podem ser acessados por um determinado computador, garantindo assim que os pacotes sejam obtidos de fontes específicas, em vez de um repositório público como nuget.org.

Qualquer seja sua natureza, um host serve como o ponto de conexão entre os criadores e os consumidores do pacote. Os criadores compilam pacotes do NuGet úteis e os publicam em um host. Os consumidores pesquisam então por pacotes úteis e compatíveis em hosts acessíveis, baixando e incluindo esses pacotes em seus projetos. Depois de instalado em um projeto, as APIs dos pacotes estão disponíveis para o restante do código do projeto.

## Gerenciamento de dependências

A capacidade de aproveitar facilmente o trabalho de outras pessoas é um dos recursos mais poderosos de um sistema de gerenciamento de pacotes. Da mesma forma, grande parte do que o NuGet faz é gerenciar essa árvore de dependência ou “grafo” em nome de um projeto. Em poucas palavras, você precisa apenas se preocupar com os pacotes que você está usando diretamente em um projeto. Se algum desses pacotes consumir outros pacotes (o que pode, por sua vez, consumir ainda mais), o NuGet cuidará de todas essas dependências de nível inferior.

Por exemplo, há três consumidores diferentes do pacote B e cada consumidor também pode especificar uma versão diferente do pacote. Isso é uma ocorrência comum, especialmente para pacotes amplamente usados. Felizmente, o NuGet faz o trabalho duro para determinar exatamente qual versão do Pacote B atende a todos os consumidores. Em seguida, o NuGet faz o mesmo para todos os outros pacotes, independente da profundidade do grafo de dependência.

## Rastreando referências e restaurando pacotes

Como projetos podem ser movidos facilmente entre os computadores de desenvolvedor, repositórios de controle do código-fonte, servidores de build e assim por diante, é altamente impraticável manter assemblies binários dos pacotes do NuGet diretamente associados a um projeto. Isso tornaria cada cópia do projeto desnecessariamente sobrecarregada (e, assim, desperdiçaria espaço em repositórios de controle do código-fonte). Também dificultaria muito a atualização de binários de pacote para versões mais recentes, pois as atualizações precisariam ser aplicadas em todas as cópias do projeto.

Em vez disso, o NuGet mantém uma lista de referências simples dos pacotes dos quais um projeto depende, incluindo dependências de nível superior e inferior. Ou seja, sempre que você instala um pacote de algum host em um projeto, o NuGet registra o identificador de pacote e o número de versão nesta lista de referência. (Desinstalar um pacote, é claro, remove-o da lista.) O NuGet, em seguida, fornece um meio para restaurar todos os pacotes referenciados mediante solicitação.

Com apenas a lista de referência, NuGet pode reinstalar, ou seja,restaurar todos esses pacotes de hosts públicos e/ou privados a qualquer momento posterior. Ao confirmar um projeto no controle do código-fonte ou compartilhá-lo de alguma outra forma, você inclui apenas a lista de referências e exclui os binários do pacote.

O computador que recebe um projeto, como um servidor de build obtendo uma cópia do projeto como parte de um sistema de implantação automatizada, simplesmente pede ao NuGet para restaurar as dependências sempre que necessário. Sistemas de build como o Azure DevOps fornecem etapas de “restauração do NuGet” para essa finalidade exata. Da mesma forma, quando os desenvolvedores obtêm uma cópia de um projeto (por exemplo, ao clonar um repositório), eles podem invocar um comando como `nuget restore` (CLI do NuGet), `dotnet restore `(CLI do dotnet) ou `Install-Package` (Console do Gerenciador de Pacotes) para obter todos os pacotes necessários. O Visual Studio, por sua vez, restaura automaticamente os pacotes ao compilar um projeto.

Claramente, a função primária do NuGet, no que diz respeito aos desenvolvedores, é manter essa lista de referência em nome do seu projeto e fornecer os meios para restaurar (e atualizar) com eficiência os pacotes referenciados.

Essa lista é mantida em um dos `dois formatos de gerenciamento de pacote`, como são chamados:

- `PackageReference` (NuGet 4.0 ou superior): Mantém uma lista de dependências de nível superior do projeto diretamente no arquivo de projeto, portanto, nenhum arquivo separado é necessário. Um arquivo associado, `obj/project.assets.json`, é gerado dinamicamente para gerenciar o grafo de dependência geral dos pacotes que um projeto usa juntamente com todas as dependências de nível inferior. `PackageReference` é sempre usado por projetos do `.NET Core`.
- `packages.config`: Como um arquivo XML que mantém uma lista simples de todas as dependências do projeto, incluindo as dependências de outros pacotes instalados. Os pacotes instalados ou restaurados são armazenados em uma pasta `packages`.

Qual formato de gerenciamento de pacotes é aplicado a um projeto depende do tipo de projeto e a versão disponível do NuGet (e/ou Visual Studio). Para verificar qual formato está sendo usado, simplesmente procure por `packages.config` na raiz do projeto depois de instalar o primeiro pacote. Se você não tiver esse arquivo, procure no arquivo de projeto diretamente por um elemento `<PackageReference>`.

Quando você tiver escolha, será recomendável usar `PackageReference`. O `packages.config` é mantido para fins de legado e não está mais em desenvolvimento ativo.

## Ferramentas do NuGet

Além da compatibilidade com a hospedagem, o NuGet também fornece uma variedade de ferramentas usadas por criadores e por consumidores.

- CLI do dotnet
- CLI do nuget.exe
- Console do Gerenciador de Pacotes
- Interface do usuário do Gerenciador de Pacotes
- Gerenciar a interface do usuário do NuGet
- MSBuild

Como você pode ver, as ferramentas do NuGet com as quais você trabalha dependem muito se você está criando ou consumindo pacotes, e a plataforma de trabalho na qual você está trabalhando. Os criadores de pacotes normalmente também são consumidores, pois eles aproveitam funcionalidades que existe em outros pacotes do NuGet. E, é claro, esses pacotes podem, por sua vez, depender de outros.

## O que mais o NuGet faz?

Até agora, você aprendeu as seguintes características do NuGet:

- O NuGet fornece o repositório central nuget.org com suporte para a hospedagem privada.
- O NuGet fornece as ferramentas que os desenvolvedores precisam para criar, publicar e consumir pacotes.
- Mais importante, o NuGet mantém uma lista de referência de pacotes usados em um projeto e a capacidade de restaurar e atualizar esses pacotes da lista.

Para fazer com que esses processos funcionem com eficiência, o NuGet realiza algumas otimizações nos bastidores. Particularmente, o NuGet gerencia um cache de pacote e uma pasta de pacotes globais para abreviar a instalação e a reinstalação. O cache evita o download de um pacote já instalado no computador. A pasta de pacotes globais permite que vários projetos compartilhem o mesmo pacote instalado, reduzindo, assim, a superfície geral do NuGet no computador. As pastas de cache e de pacotes globais também são muito úteis quando você restaura com frequência um grande número de pacotes, como em um servidor de build.

Em um projeto individual, o NuGet gerencia o grafo de dependência geral, que inclui novamente a resolução de múltiplas referências para versões diferentes do mesmo pacote. É muito comum que um projeto adote uma dependência de um ou mais pacotes que tenham eles próprios as mesmas dependências. Alguns dos pacotes de utilitário mais úteis no nuget.org são utilizados por muitos outros pacotes. No grafo de dependência inteiro, dez, você poderia ter facilmente ter dez referências diferentes para diferentes versões do mesmo pacote. Para evitar trazer várias versões do pacote para o próprio aplicativo, o NuGet classifica qual versão única pode ser usada por qualquer consumidor.

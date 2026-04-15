
# MédiaFEOB 🎓

O **MédiaFEOB** é uma solução mobile desenvolvida para auxiliar os estudantes da **UNIFEOB** a gerirem seu desempenho acadêmico com precisão. O aplicativo automatiza o cálculo das médias e oferece uma funcionalidade preditiva ("Quanto falta?"), eliminando a necessidade de planilhas manuais.

---

## 🚀 Visão do Produto

Customizado para as regras de negócio da instituição, o app fornece feedback visual imediato sobre o status do aluno (Aprovado ou Recuperação), garantindo que o estudante saiba exatamente o esforço necessário para atingir seus objetivos.

### Funcionalidades Principais
* **Cálculo em Tempo Real:** Resultados atualizados instantaneamente conforme as notas são inseridas.
* **Status Detalhado:** Visão individual do status por bimestre (B1, B2) e média final do semestre.
* **Calculadora Inversa:** Exibe os pontos exatos necessários no 2º bimestre para aprovação direta.
* **Interface Otimizada:** Design azul institucional focado em legibilidade e performance.

---

## 🛠️ Arquitetura e Tecnologias

O projeto adota o padrão **MVVM (Model-View-ViewModel)** com **Clean Architecture**, garantindo separação total entre a lógica matemática e a interface.

* **Linguagem:** Dart 3.x
* **Framework:** Flutter
* **Gerência de Estado:** Provider (`ChangeNotifier`)
* **Design Pattern:** Observer (Reatividade UI-Model)

### Estrutura de Pastas (`lib/src`)
```text
├── core/
│   └── theme/          # Configuração visual (Azul FEOB) e estilos globais.
├── features/
│   └── score_calculator/
│       ├── model/      # Entidade ScoreModel (Cérebro matemático).
│       ├── view/       # Telas (CalculatorScreen).
│       ├── view_model/ # Lógica de estado (CalculatorViewModel).
│       └── widgets/    # Componentes reutilizáveis (Inputs).
└── main.dart           # Ponto de entrada.
```

---

## 📊 Composição das Notas (B2 Atualizado)

O sistema respeita a distribuição oficial de pontos da instituição:

### 1º Bimestre (Máximo 10,0)
* **P1:** 7,0 pts
* **AIA 1:** 1,5 pts
* **Atitudinais 1:** 1,5 pts

### 2º Bimestre (Máximo 10,0)
* **P2:** 3,0 pts
* **Projeto Integrador (PI):** 4,0 pts
    * *Validação Profs: 1,0 pt*
    * *Apresentação: 2,0 pts*
    * *Trabalho Equipe: 0,5 pt*
    * *Vídeo Formação: 0,5 pt*
* **AIA 2:** 1,5 pts
* **Atitudinais 2:** 1,5 pts

> **Critério de Aprovação:** $\text{Média} = \frac{B1 + B2}{2} \geq 7,0$

---

## 🏗️ Como Rodar e Gerar o APK

1.  **Clone e Instale:**
    ```bash
    git clone https://github.com/henrique-molinari/minha-nota-unifeob.git
    cd minha_nota_unifeob
    flutter pub get
    ```

2.  **Gere os Ícones:**
    ```bash
    flutter pub run flutter_launcher_icons
    ```

3.  **Build Otimizado (Versão Leve):**
    Para gerar o APK de aproximadamente 15-20MB:
    ```bash
    flutter build apk --release --split-per-abi
    ```

---

## 📥 Download e Instalação Rápida
Nota: Caso queira apenas instalar o aplicativo no seu telemóvel sem precisar de configurar o ambiente de desenvolvimento, aceda ao link abaixo:

🔗 (Baixar MédiaFEOB (APK)) [https://drive.google.com/drive/folders/1xck59iAj5L0pIB-LDUkX3FAltS9Htz1U?usp=sharing]

**Desenvolvido por Henrique Molinari.**
*Este projeto é uma ferramenta de apoio acadêmico independente.*

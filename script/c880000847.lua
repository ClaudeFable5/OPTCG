-- AUTO-GENERATED: OP06-113 / 라키
-- rules_id=OP06-113 script_id=880000847 fingerprint=851442fd9ed4ce8f31230180a97b3fda0883cb7fae3c6534f7012ef52b326042
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-113]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            keyword=[[BLOCKER]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            filter={
              name_neq=[[라키]],
              trait=[[샨도라의 전사]],
            },
            op=[[CHARACTER_EXISTS]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[「라키」 이외의 자신의 《샨도라의 전사》 특징을 가진 캐릭터가 있을 경우, 이 캐릭터는 【블로커】를 얻는다.
(상대의 어택 선언 후, 이 카드를 레스트로 하고 어택의 대상을 이 카드로 할 수 있다)]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-113]],
    schema_version=1,
  })
end

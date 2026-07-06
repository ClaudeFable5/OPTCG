-- AUTO-GENERATED: ST04-008 / 잭
-- rules_id=ST04-008 script_id=880001773 fingerprint=223fdeeeb66bec6120f5f2d2be911e821fe5ce805a9bca00bd2e04f8d6674da2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST04-008]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[ACTIVE]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】 자신의 패를 1장 버릴 수 있다: 두웅!! 덱에서 두웅!!을 1장까지 액티브 상태로 추가한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST04-008]],
    schema_version=1,
  })
end

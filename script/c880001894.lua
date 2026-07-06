-- AUTO-GENERATED: ST12-012 / 샬롯 푸딩
-- rules_id=ST12-012 script_id=880001894 fingerprint=63b6767fffb0f4243581d7a1b866e6c83d1a11f2a4972aa1671128a21b8f0666
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST12-012]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_HAND]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 주인의 패로 되돌린다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST12-012]],
    schema_version=1,
  })
end

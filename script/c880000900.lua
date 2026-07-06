-- AUTO-GENERATED: OP07-045 / 징베
-- rules_id=OP07-045 script_id=880000900 fingerprint=27513434cb0e85077671c130a1594c11c4cbf0e65ac2b18b7086dfffd9d30eb5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-045]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=4,
              name_neq=[[징베]],
              trait=[[왕의 부하 칠무해]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 「징베」 이외의 코스트 4 이하인 《왕의 부하 칠무해》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-045]],
    schema_version=1,
  })
end

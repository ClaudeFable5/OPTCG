-- AUTO-GENERATED: OP06-063 / 빈스모크 소라
-- rules_id=OP06-063 script_id=880000797 fingerprint=9c347ff407a92e73804c5559ad83867b7cbf1942ad4418937312ebf012c96006
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-063]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            destination=[[HAND]],
            filter={
              card_type=[[CHARACTER]],
              power_lte=4000,
              trait=[[빈스모크 가문]],
            },
            mode=[[UP_TO]],
            op=[[ADD_FROM_TRASH]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[FIELD_DON_LTE_OPPONENT]],
            player=[[YOU]],
          },
        },
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패 1장을 버릴 수 있다: 자신 필드의 두웅!!이 상대 필드의 두웅!! 수 이하인 경우, 자신의 트래시에서 파워 4000 이하인 《빈스모크 가문》 특징을 가진 캐릭터 카드를 1장까지 패에 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-063]],
    schema_version=1,
  })
end

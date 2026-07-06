-- AUTO-GENERATED: OP09-028 / 상디
-- rules_id=OP09-028 script_id=880001123 fingerprint=0d5da20fb771493794241a3448d8c80b1046b0f871f13fe9e52d1766ae608306
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-028]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=4,
              trait_any={
                [[ODYSSEY]],
                [[밀짚모자 일당]],
              },
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_TRASH]],
            player=[[YOU]],
            rested=true,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            position=[[TOP_OR_BOTTOM]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 라이프 위나 아래에서 1장을 패에 더할 수 있다: 자신의 트래시에서 코스트 4 이하인 《ODYSSEY》 또는 《밀짚모자 일당》 특징을 가진 캐릭터 카드를 1장까지 레스트 상태로 등장시킨다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-028]],
    schema_version=1,
  })
end

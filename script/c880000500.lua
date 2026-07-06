-- AUTO-GENERATED: OP04-010 / 토니토니 쵸파
-- rules_id=OP04-010 script_id=880000500 fingerprint=b29c928234b87484cf7491782a1fd089603ebea64f82396be4cfd05d5bddb3a8
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-010]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              power_lte=3000,
              trait=[[동물]],
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
        source_text=[[【등장 시】자신의 패에서 파워 3000 이하인 《동물》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-010]],
    schema_version=1,
  })
end

-- AUTO-GENERATED: ST03-004 / 겟코 모리아
-- rules_id=ST03-004@42a6b1da26a8 script_id=880001751 fingerprint=42a6b1da26a82ef451b6f8e903a2f3df7df1be49b1f35c776ed69703d2b1d8da
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST03-004]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            destination=[[HAND]],
            filter={
              card_type=[[CHARACTER]],
              cost_lte=4,
              name_neq=[[겟코 모리아]],
              trait_any={
                [[왕의 부하 칠무해]],
                [[스릴러 바크 해적단]],
              },
            },
            mode=[[UP_TO]],
            op=[[ADD_FROM_TRASH]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 트래시에서 「겟코 모리아」 이외의 코스트 4 이하인 《왕의 부하 칠무해》 또는 《스릴러 바크 해적단》 특징을 가진 캐릭터 카드를 1장까지 패에 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST03-004@42a6b1da26a8]],
    schema_version=1,
  })
end

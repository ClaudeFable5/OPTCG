-- AUTO-GENERATED: OP10-043 / 우시
-- rules_id=OP10-043 script_id=880001258 fingerprint=cb2e6421cf927113b50a3a441c7a05a3e88d3b4469cd94cb0b10a0f909fd0e2e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-043]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            keyword=[[BANISH]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              filter={
                name=[[몽키 D. 루피]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              trait=[[드레스로자]],
            },
            kinds={
              [[LEADER]],
              [[STAGE]],
            },
            op=[[REST_OWN_CARD]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 《드레스로자》 특징을 가진 리더 또는 스테이지 1장을 레스트할 수 있다: 이번 턴 동안, 자신의 캐릭터인 「몽키 D. 루피」 1장까지는 【배니시】를 얻는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-043]],
    schema_version=1,
  })
end

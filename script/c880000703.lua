-- AUTO-GENERATED: OP05-090 / 리쿠 돌드 3세
-- rules_id=OP05-090 script_id=880000703 fingerprint=8a1771c21e00cc61e39452003ffe8bbdc2e5526dfb2b3a73f440f21a806e4549
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-090]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                trait=[[드레스로자]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】/【KO 시】이번 턴 동안, 자신의 《드레스로자》 특징을 가진 캐릭터 1장까지의 파워 +2000.]],
        timings={
          [[ON_PLAY]],
          [[ON_KO]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP05-090]],
    schema_version=1,
  })
end

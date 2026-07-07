-- AUTO-GENERATED: ST15-004 / 삿치
-- rules_id=ST15-004 script_id=880002077 fingerprint=1ef53238c5fd7997e6347971390c799c2e3ad3ce4ac7d90f4e4f016db71ee278
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST15-004]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            player=[[YOU]],
            position=[[TOP]],
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[LEADER_TRAIT_CONTAINS]],
            player=[[YOU]],
            trait=[[흰 수염 해적단]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 『흰 수염 해적단』을 포함한 특징을 가진 경우, 이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -2000. 그 후, 자신의 라이프 위에서 1장을 패에 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST15-004]],
    schema_version=1,
  })
end

-- AUTO-GENERATED: OP15-011 / 파알
-- rules_id=OP15-011 script_id=880002313 fingerprint=a4238d704e4dc1f30a4a185c098e484ab04621f7dc7afae1b0f51fc80bfc1947
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-011]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            keyword=[[BLOCKER]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            amount=2000,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[이스트 블루]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】자신의 리더가 《이스트 블루》 특징을 가진 경우, 이 캐릭터는 【블로커】를 얻고 파워 +2000.]],
        timings={
          [[CONTINUOUS_OPPONENT_TURN]],
        },
      },
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                base_power_lte=6000,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[이스트 블루]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 리더가 《이스트 블루》 특징을 가진 경우, 상대의 원래 파워 6000 이하인 캐릭터 1장까지를 KO한다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-011]],
    schema_version=1,
  })
end

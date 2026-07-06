-- AUTO-GENERATED: OP08-002 / 마르코
-- rules_id=OP08-002 script_id=880000978 fingerprint=a4253fc7d14614e284ff0c1c4e8f84ef3a5d4c269332deb5275f0b45b6a2c51c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-002]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            op=[[RETURN_HAND_TO_DECK]],
            player=[[YOU]],
            positions={
              [[DECK_TOP]],
              [[DECK_BOTTOM]],
            },
            ["then"]=true,
          },
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
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【두웅!!×1】【기동: 메인】【턴 1회】카드를 1장 뽑고, 자신의 패 1장을 덱 맨 위나 아래로 되돌린다. 그 후, 이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -2000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-002]],
    schema_version=1,
  })
end

-- AUTO-GENERATED: OP07-003 / 아웃룩 3세
-- rules_id=OP07-003 script_id=880000856 fingerprint=82aa5515f6c0ff61736db333488e094cdaf4d6c358b0fbb5da483d5a1ade93eb
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-003]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=2,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 트래시에 놓을 수 있다: 이번 턴 동안, 상대의 캐릭터 2장까지의 파워 -2000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-003]],
    schema_version=1,
  })
end
